( function ( window, undefined ) {
  var Aloha = window.Aloha || ( window.Aloha = {} );

  Aloha.settings = {
    modules: ['aloha', 'aloha/jquery'],
    editables: '.editable-long-text, .editable-short-text',
    logLevels: { 'error': true, 'warn': false, 'info': false, 'debug': false, 'deprecated': false },
    errorhandling: false,
    sidebar: {
      disabled: true
    },
    ribbon: false,
    locale: 'en',

    plugins: {
      load: 'common/format,common/list,common/link,common/block,common/undo,common/contenthandler,common/paste',

      format: {
        config: [  'b', 'i', 'p', 'sub', 'sup', 'del', 'title', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'pre', 'removeFormat' ],
        editables: {
          // No formatting for oneliners
          '.editable-short-text': [] 
        }
      },

      list: {
        // all elements with no specific configuration get an UL, just for fun :)
        config: [ 'ul', 'ol' ],
        editables: {
          // Even if this is configured it is not set because OL and UL are not allowed in H1.
          '.editable-short-text': []
        }
      },

      abbr: {
        // all elements with no specific configuration get an UL, just for fun :)
        config: [ 'abbr' ],
        editables: {
          // Even if this is configured it is not set because OL and UL are not allowed in H1.
          '.editable-short-text': []
        }
      },

      link: {
        // all elements with no specific configuration may insert links
        config: [ 'a' ],
        editables: {
          '.editable-short-text': []
        },
        // all links that match the targetregex will get set the target
        // e.g. ^(?!.*aloha-editor.com).* matches all href except aloha-editor.com
        targetregex: '^(?!.*loo.no).*',
        // this target is set when either targetregex matches or not set
        // e.g. _blank opens all links in new window
        target: '_blank',
        // the same for css class as for target
        // handle change of href
        onHrefChange: function ( obj, href, item ) {
          var jQuery = Aloha.require( 'aloha/jquery' );
          if ( item ) {
            jQuery( obj ).attr( 'data-name', item.name );
          } else {
            jQuery( obj ).removeAttr( 'data-name' );
          }
        }
      },

      table: {
        // all elements with no specific configuration are not allowed to insert tables
        config: [ 'table' ],
        editables: {
          // Don't allow tables in top-text
          '.editable-short-text': [ '' ]
        }
      }

    }
  };
} )( window );
