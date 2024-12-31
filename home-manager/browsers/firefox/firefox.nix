{config, lib, pkgs, inputs, ... }: 
{
  programs.firefox = { 
     enable = true;
     profiles.astor = {

       search.engines = {
         
       };

       #extensions = with inputs.firefox-addons.packages."x86-64_linux"; [
        # ublock-origin
       #];

       #!!!The following configuration here is NOT mine! 

       userContent = ''
        /*
┏━╸┏━┓┏┓╻╺┳╸┏━┓
┣╸ ┃ ┃┃┗┫ ┃ ┗━┓
╹  ┗━┛╹ ╹ ╹ ┗━┛
*/
:root {
  --main-font: "FantasqueSansM Nerd Font";
}

pre, code, samp, var
{
  font-family: var(--main-font) !important;
}

/*
┏━┓┏━╸┏━┓┏━┓╻  ╻  ┏┓ ┏━┓┏━┓
┗━┓┃  ┣┳┛┃ ┃┃  ┃  ┣┻┓┣━┫┣┳┛
┗━┛┗━╸╹┗╸┗━┛┗━╸┗━╸┗━┛╹ ╹╹┗╸
╻ ╻╻╺┳┓╺┳┓┏━╸┏┓╻
┣━┫┃ ┃┃ ┃┃┣╸ ┃┗┫
╹ ╹╹╺┻┛╺┻┛┗━╸╹ ╹
*/

:root {
  scrollbar-width: none !important;
}

@-moz-document url(about:privatebrowsing) {
  :root {
    scrollbar-width: none !important;
  }
}

/*
╻ ╻┏━┓┏┳┓┏━╸┏━┓┏━┓┏━╸┏━╸
┣━┫┃ ┃┃┃┃┣╸ ┣━┛┣━┫┃╺┓┣╸
╹ ╹┗━┛╹ ╹┗━╸╹  ╹ ╹┗━┛┗━╸
*/

@-moz-document url("about:home"), url("about:newtab"){
    .search-wrapper,
    .top-site-outer .title{
        font-family: var(--main-font) !important;
    }

    .top-site-outer .title{
        font-size: 1rem !important;
    }

    .top-site-outer .top-site-inner > a {
        padding: 10px 10px 4px !important;
    }

    .search-handoff-button, .search-wrapper input {
        background: #d8d8d81f !important;
        border-radius: 10px !important;
    }

    #newtab-search-text::placeholder {
        opacity: 0 !important;
    }
    :root[lwt-newtab-brighttext]{
            --newtab-primary-action-background: transparent !important;
    }

    .search-wrapper .search-button,
    .search-wrapper .logo-and-wordmark .logo,
    .fake-textbox,
    .top-site-outer .tile,
    .icon.icon-pin-small {
        display: none !important;
    }

}
       '';

       userChrome = ''

      #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] #sidebar-header {
  visibility: collapse;
}
 
#sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] {
  --uc-sidebar-width: 38px !important;
  --uc-sidebar-hover-width: 150px;
  --uc-autohide-sidebar-delay: 600ms; /* Wait 0.3s before hiding sidebar */
  position: relative;
  min-width: var(--uc-sidebar-width) !important;
  width: var(--uc-sidebar-width) !important;
  max-width: var(--uc-sidebar-width) !important;
  z-index:3;
}
 
#sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] > #sidebar-splitter {
  display: none
}
 
#sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] > #sidebar {
  transition: min-width 115ms linear var(--uc-autohide-sidebar-delay) !important;
  min-width: var(--uc-sidebar-width) !important;
  will-change: min-width;
}
 
#sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"]:hover > #sidebar {
  min-width: var(--uc-sidebar-hover-width) !important;
  transition-delay: 0ms !important
}
 
#sidebar-splitter {
    display: none;
}

/*
┏━╸┏━┓┏┓╻╺┳╸┏━╸╻ ╻╺┳╸
┃  ┃ ┃┃┗┫ ┃ ┣╸ ┏╋┛ ┃
┗━╸┗━┛╹ ╹ ╹ ┗━╸╹ ╹ ╹
┏┳┓┏━╸┏┓╻╻ ╻
┃┃┃┣╸ ┃┗┫┃ ┃
╹ ╹┗━╸╹ ╹┗━┛
*/

#toolbar-menubar menupopup,
#toolbar-context-menu,
#toolbar-context-menu menupopup,
#unified-extensions-context-menu,
#unified-extensions-context-menu menupopup,
#placesContext, #placesContext menupopup,
#downloadsContextMenu, #downloadsContextMenu menupopup,
#sidebarMenu-popup, #PopupSearchAutoComplete,
:is(#back-button, #forward-button) menupopup,
#permission-popup-menulist menupopup,
#contentAreaContextMenu[showservicesmenu="true"],
#contentAreaContextMenu[showservicesmenu="true"] menupopup {
  --panel-background: var(--arrowpanel-background) !important;
  --panel-border-color: var(--toolbar-bgcolor) !important;
  --toolbar-field-focus-background-color: var(--toolbarbutton-icon-fill) !important;
  --panel-color: var(--toolbarbutton-icon-fill) !important;

  menu:where([_moz-menuactive="true"]:not([disabled="true"])), 
  menuitem:where([_moz-menuactive="true"]:not([disabled="true"])) {
    background-color: var(--panel-item-hover-bgcolor) !important;
    color: var(--toolbarbutton-icon-fill) !important;
  }
  
  menu:where([_moz-menuactive="true"][disabled="true"]), 
  menuitem:where([_moz-menuactive="true"][disabled="true"]) {
    background-color: transparent !important;
  } 
}

/*
┏┳┓╻┏┓╻╻┏┳┓┏━┓╻
┃┃┃┃┃┗┫┃┃┃┃┣━┫┃
╹ ╹╹╹ ╹╹╹ ╹╹ ╹┗━╸
┏━╸╻ ╻╺┳╸┏━╸┏┓╻┏━┓╻┏━┓┏┓╻┏━┓
┣╸ ┏╋┛ ┃ ┣╸ ┃┗┫┗━┓┃┃ ┃┃┗┫┗━┓
┗━╸╹ ╹ ╹ ┗━╸╹ ╹┗━┛╹┗━┛╹ ╹┗━┛
┏┳┓┏━╸┏┓╻╻ ╻
┃┃┃┣╸ ┃┗┫┃ ┃
╹ ╹┗━╸╹ ╹┗━┛
 */

#unified-extensions-view {
  --uei-icon-size: 16px;
}

.unified-extensions-item-menu-button.subviewbutton {
  padding: 0px !important;
  margin-inline-end: 0 !important;
}

.unified-extensions-item-action-button.subviewbutton {
  padding-block: 6px !important;
}

.unified-extensions-item-menu-button.subviewbutton > .toolbarbutton-icon {
  padding: 4px !important;
}

.unified-extensions-item-message-deck {
  display: none
}

#unified-extensions-view > vbox > vbox > .unified-extensions-item {
  padding-block: 0px !important;
}

#unified-extensions-panel .unified-extensions-item {
  margin-block: 0 !important;
}

/*
┏━╸┏━┓┏┓╻╺┳╸┏━┓
┣╸ ┃ ┃┃┗┫ ┃ ┗━┓
╹  ┗━┛╹ ╹ ╹ ┗━┛
*/

* {
  font-family: "FantasqueSansM Nerd Font" !important;
  font-size: 16px !important;
}

/*
╻ ╻┏━┓╻  ┏┓ ┏━┓┏━┓
┃ ┃┣┳┛┃  ┣┻┓┣━┫┣┳┛
┗━┛╹┗╸┗━╸┗━┛╹ ╹╹┗╸
╻ ╻╻┏━╸╻ ╻
┃┏┛┃┣╸ ┃╻┃
┗┛ ╹┗━╸┗┻┛
*/

.urlbarView-row-inner, .urlbarView-no-wrap  {
	align-items: center !important;
}

findbar {
  --findbar-wdt: 775px;
  --margin: 1rem;
  --rounding: 8px;

  position: fixed !important;
  z-index: 5 !important;
  bottom: var(--margin);

  left: calc(
    (
      100vw
      - var(--findbar-wdt)
    ) / 2
  );

  width: var(--findbar-wdt);

  border-radius: var(--rounding) !important;
}

/*
╻ ╻╻╺┳┓╺┳┓┏━╸┏┓╻
┣━┫┃ ┃┃ ┃┃┣╸ ┃┗┫
╹ ╹╹╺┻┛╺┻┛┗━╸╹ ╹
╻ ╻┏━┓╻  ┏┓ ┏━┓┏━┓
┃ ┃┣┳┛┃  ┣┻┓┣━┫┣┳┛
┗━┛╹┗╸┗━╸┗━┛╹ ╹╹┗╸
*/

#urlbar:not([customizing]) {
  opacity: 0;
  transition: max-height 1s linear 3s, opacity 600ms ease 3s !important;
}

#urlbar:hover,
#urlbar:focus-within {
  opacity: 1;
  transition-duration: 200ms !important;
  transition-delay: 0s, 200ms !important;
}

#urlbar:focus-within {
  height: 0% !important;
}

.urlbar-input-container {
    height: 100% !important;
}

.urlbarView {
    background: var(--arrowpanel-background) !important;
    border-radius: 8px;
}

/* 
┏━┓┏━╸┏┳┓┏━┓╻ ╻╻┏┓╻┏━╸
┣┳┛┣╸ ┃┃┃┃ ┃┃┏┛┃┃┗┫┃╺┓
╹┗╸┗━╸╹ ╹┗━┛┗┛ ╹╹ ╹┗━┛
┏━╸┏━┓┏┳┓┏━┓┏━┓┏┓╻┏━╸┏┓╻╺┳╸┏━┓
┃  ┃ ┃┃┃┃┣━┛┃ ┃┃┗┫┣╸ ┃┗┫ ┃ ┗━┓
┗━╸┗━┛╹ ╹╹  ┗━┛╹ ╹┗━╸╹ ╹ ╹ ┗━┛
*/

/* Tabs elements  */
#TabsToolbar { display: none !important; }

#TabsToolbar .titlebar-spacer {
    display: none !important;
}

/* Titlebar Window Control Buttons */
.titlebar-buttonbox-container{ display:none }

/* Url Bar  */
#urlbar-input-container {
  border: 1px solid rgba(0, 0, 0, 0) !important;
}

#urlbar-container {
  margin: 0 !important;
  padding-block: 2px !important;
  min-height: var(--urlbar-height) !important;
}

#urlbar {
  top: 0 !important;
}

#urlbar[focused='true'] > #urlbar-background {
  box-shadow: none !important;
}

#navigator-toolbox {
  border: none !important;
}

/* Bookmarks bar  */
.bookmark-item .toolbarbutton-icon {
  display: none;
}
toolbarbutton.bookmark-item:not(.subviewbutton) {
  min-width: 1.6em;
}

/* Toolbar  */
#tracking-protection-icon-container,
#urlbar-zoom-button,
#star-button-box,
#pageActionButton,
#pageActionSeparator,
#tabs-newtab-button,
#back-button,
#forward-button,
.tab-secondary-label {
  display: none !important;
}

/* Disable elements  */
#context-pocket,
#context-sendpagetodevice,
#context-selectall,
#context-inspect-a11y,
#context-sendlinktodevice,
#context-openlinkinusercontext-menu,
#context-savelink,
#context-savelinktopocket,
#context-sendlinktodevice,
#context-sendimage,
#context-print-selection {
  display: none !important;
}

#context_bookmarkTab,
#context_moveTabOptions,
#context_sendTabToDevice,
#context_reopenInContainer,
#context_selectAllTabs,
#context_closeTabOptions {
  display: none !important;
} 
 
       '';

       settings = {
         "identity.fxaccounts.enabled" = false;
         "browser.download.panel.shown" = true;
	 "dom.security.https_only_mode" = true;
	 "signon.rememberSignons" = true;
       }; 
		

       bookmarks = [
         {
            name = "wikipedia";
	    tags = [ "wiki" ];
	    keyword = "wiki";
	    url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
         }
       ];
 
     };

    
   }; 

}
