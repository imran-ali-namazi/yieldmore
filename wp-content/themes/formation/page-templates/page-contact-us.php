<?php

/*
 * Template Name: Contact Page
 * Description: A Page Template with a Contact Form.
 */

  //response generation function

  $response = "";

  //function to generate response
  function formation_contact_form_generate_response($type, $message){

    global $response;

    if($type == "success") $response = "<div class='success'>{$message}</div>";
    else $response = "<div class='error'>{$message}</div>";

  }

  //response messages
  $not_human       = __('Human verification incorrect.', 'formation');
  $missing_content = __('Please supply all information.', 'formation');
  $email_invalid   = __('Email Address Invalid.', 'formation');
  $message_unsent  = __('Message was not sent. Try Again.', 'formation');
  $message_sent    = __('Thanks! Your message has been sent.', 'formation');

  //user posted variables
  if(isset($_POST['message_name'])){
    $name = $_POST['message_name'];
    $email = $_POST['message_email'];
    $message = "Message from: ".$name."\r\n";
    $message .= "Email: ".$email."\r\n";
    $message .= "Message text: ".$_POST['message_text']."\r\n";
    $human = $_POST['message_human'];
  }else{
    $name = '';
    $email = '';
    $message = '';
    $human = '';
  }
  

  //php mailer variables
  $to = get_option('admin_email');
  $subject = "Someone sent a message from ".get_bloginfo('name');
  $headers = 'From: '. $email . "\r\n" .
    'Reply-To: ' . $email . "\r\n";

  if(!$human == 0){
    if($human != 2) formation_contact_form_generate_response("error", $not_human); //not human!
    else {

      //validate email
      if(!filter_var($email, FILTER_VALIDATE_EMAIL))
        formation_contact_form_generate_response("error", $email_invalid);
      else //email is valid
      {
        //validate presence of name and message
        if(empty($name) || empty($message)){
          formation_contact_form_generate_response("error", $missing_content);
        }
        else //ready to go!
        {
          $sent = wp_mail($to, $subject, strip_tags($message), $headers);
          if($sent) formation_contact_form_generate_response("success", $message_sent); //message sent!
          else formation_contact_form_generate_response("error", $message_unsent); //message wasn't sent
        }
      }
    }
  }
  else if (isset($_POST['submitted'])) formation_contact_form_generate_response("error", $missing_content);

?>

<?php get_header(); ?>
	<header class="entry-header">
		<h1 class="page-title"><?php the_title(); ?></h1><span class="breadcrumbs"><?php if (function_exists('formation_breadcrumbs')) formation_breadcrumbs(); ?></span>
		</header><!-- .entry-header -->
		<div id="primary_wrap">
		<div id="primary" class="content-area">
			<div id="content" class="site-content" role="main">

      <?php while ( have_posts() ) : the_post(); ?>

          <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>

            <div class="entry-content">
              <?php the_content(); ?>

              <style type="text/css">
                .error{
                  padding: 5px 9px;
                  border: 1px solid red;
                  color: red;
                  border-radius: 3px;
                }

                .success{
                  padding: 5px 9px;
                  border: 1px solid green;
                  color: green;
                  border-radius: 3px;
                }

                form span{
                  color: red;
                }
              </style>

              <div id="respond">
                <?php echo $response; ?>
                <form action="<?php the_permalink(); ?>" method="post">
                  <p><label for="name">Name: <span>*</span> <br><input type="text" name="message_name" value="<?php echo esc_attr($name); ?>"></label></p>
                  <p><label for="message_email">Email: <span>*</span> <br><input type="text" name="message_email" value="<?php echo esc_attr($email); ?>"></label></p>
                  <p><label for="message_text">Message: <span>*</span> <br><textarea type="text" name="message_text"></textarea></label></p>
                  <p><label for="message_human">Human Verification: <span>*</span> <br><input type="text" style="width: 60px;" name="message_human"> + 3 = 5</label></p>
                  <input type="hidden" name="submitted" value="1">
                  <p><input type="submit"></p>
                </form>
              </div>


            </div><!-- .entry-content -->

          </article><!-- #post -->

      <?php endwhile; // end of the loop. ?>

    </div><!-- #content -->
  </div><!-- #primary -->

<?php get_sidebar(); ?>
</div>
<?php get_footer(); ?>