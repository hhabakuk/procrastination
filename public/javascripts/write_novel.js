

overrideText = 'Seven a.m., waking up in the morning. Gotta be fresh, gotta go downstairs. Gotta have my bowl, gotta have cereal. Seein everything, the time is goin. Tickin on and on, everybodys rushin. Gotta get down to the bus stop. Gotta catch my bus, I see my friends (My friends). Kickin in the front seat. Sittin in the back seat. Gotta make my mind up. Which seat can I take?. Its Friday, Friday. Gotta get down on Friday. Everybodys lookin forward to the weekend, weekend. Friday, Friday. Gettin down on Friday. Everybodys lookin forward to the weekend';
  
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