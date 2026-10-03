<?php
variables([
	VARLinkToSectionHome => true,
]);

function site_before_render() {
	autosetPageMenu([VARDontOverwriteLogo => true]);
}

function after_file() {
	$show = !nodeIs($thisSection = sectionValue()) || nodeIs(SITEHOME);
	if (!$show) return;

	sectionId('dir-list', 'container text-center content-box');
	h2(variable('name') .'\'s Sections');
	foreach (variable('sections') as $ix => $section)//TODO: use cssUX
		echo makeLink(humanize($section), pageUrl($section), false, false, 
			'btn m-2 '
			 . ($section == $thisSection ? 'btn-primary ' . cssUX::underline : 'btn-secondary'))
			 . ($ix % 4 == 2 ? BRNL : '');
	sectionEnd();
}
