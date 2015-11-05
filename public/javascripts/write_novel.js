overrideText = 'Ingel sometimes does not let me to open the window during the night. This makes me depressed.';
  
  appendChar = function(text) {
    var nextChar = overrideText.slice(text.length, text.length+1);
    var o = text + nextChar;
    return(o);
  }
  
  $( document ).ready(function(){
    var vaev = $("#vaev");
    var nupp = $("#submit");
    
    vaev.keypress(function(){
      var text = vaev.val();
      newVal = appendChar(text);
      vaev.val(newVal);
      return(false);
    });
    
    
    
  });