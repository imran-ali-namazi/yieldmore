//http://stackoverflow.com/questions/4340143/sidebar-that-follows-scroll-but-scrolls-self-if-taller-than-viewport
//http://jsfiddle.net/ryanmaxwell/25QaE/
$(function() {
    var $window = $(window);
    var lastScrollTop = $window.scrollTop();
    var wasScrollingDown = true;

    var $sidebar = $("#wrap-left");
    if ($sidebar.length > 0) {
        var initialSidebarTop = $sidebar.position().top;

        $window.scroll(function(event) {

            var windowHeight = $window.height();
            var sidebarHeight = $sidebar.outerHeight();

            var scrollTop = $window.scrollTop();
            var scrollBottom = scrollTop + windowHeight;

            var sidebarTop = $sidebar.position().top;
            var sidebarBottom = sidebarTop + sidebarHeight;

            var heightDelta = Math.abs(windowHeight - sidebarHeight);
            var scrollDelta = lastScrollTop - scrollTop;

            var isScrollingDown = (scrollTop > lastScrollTop);
            var isWindowLarger = (windowHeight > sidebarHeight);

            if ((isWindowLarger && scrollTop > initialSidebarTop) || (!isWindowLarger && scrollTop > initialSidebarTop + heightDelta)) {
                $sidebar.addClass('fixed');
            } else if (!isScrollingDown && scrollTop <= initialSidebarTop) {
                $sidebar.removeClass('fixed');
            }

            var dragBottomDown = (sidebarBottom <= scrollBottom && isScrollingDown);
            var dragTopUp = (sidebarTop >= scrollTop && !isScrollingDown);

            if (dragBottomDown) {
                if (isWindowLarger) {
                    $sidebar.css('top', 0);
                } else {
                    $sidebar.css('top', -heightDelta);
                }
            } else if (dragTopUp) {
                $sidebar.css('top', 0);
            } else if ($sidebar.hasClass('fixed')) {
                var currentTop = parseInt($sidebar.css('top'), 10);
                
                var minTop = -heightDelta;
                var scrolledTop = currentTop + scrollDelta;
                
                var isPageAtBottom = (scrollTop + windowHeight >= $(document).height());
                var newTop = (isPageAtBottom) ? minTop : scrolledTop;
                
                $sidebar.css('top', newTop);
            }

            lastScrollTop = scrollTop;
            wasScrollingDown = isScrollingDown;
        });
    }
});