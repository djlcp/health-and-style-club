CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...

  // config.toolbar_mini = [
  //   ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
  // ];
  // config.toolbar = "mini";
  config.extraPlugins = 'videodetector';
  // config.removePlugins = 'iframe';


  config.toolbarGroups = [
  		{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
  		{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
  		{ name: 'links' },
  		{ name: 'insert' },
  		{ name: 'forms' },
  		{ name: 'tools' },
  		{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
  		{ name: 'others' },
  		'/',
  		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
  		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
  		{ name: 'styles' },
  		{ name: 'colors' },
  		{ name: 'about' }
  	];


  	config.skin = 'moono-lisa';

  	// Remove some buttons provided by the standard plugins, which are
  	// not needed in the Standard(s) toolbar.
  	config.removeButtons = 'Source,Styles,Anchor,SpecialChar,Image,Table,About,Flash';

  	// Set the most common block elements.
  	config.format_tags = 'p;h1;h2;h3;pre';

  	// Simplify the dialog windows.
  	config.removeDialogTabs = 'image:advanced;link:advanced';

  	// Highlight misspelt words by default, set spellcheck language to GB English.
  	config.scayt_autoStartup = true;
  	config.scayt_sLang = 'en_GB';



  // ... rest of the original config.js  ...
}
