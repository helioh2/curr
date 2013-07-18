var strip, cards, cardNumber = 0;

window.addEventListener("load", function(){
  // translate all the TEXTAREA nodes into DIVs, and all TT nodes into SPANs
  var codeSnippets = document.getElementsByTagName('textarea');
  for(var i=0; i < codeSnippets.length; i++){
    var node = document.createElement('div');
    node.className = 'editbox';
    codeSnippets[i].parentNode.insertBefore(node, codeSnippets[i]);
    CodeMirror.runMode(codeSnippets[i].value, "scheme2", node);
    codeSnippets[i].style.display = 'none';
  }
  var codeSnippets = document.getElementsByTagName('tt');
  for(var i=0; i < codeSnippets.length; i++){
    var node = document.createElement('span');
    node.className = 'editbox';
    codeSnippets[i].parentNode.insertBefore(node, codeSnippets[i]);
    CodeMirror.runMode(codeSnippets[i].firstChild.nodeValue, "scheme2", node);
    codeSnippets[i].style.display = 'none';
  }
  // setup globals we'll use later
  cardNumber = 0;
  strip = document.getElementsByClassName('lesson')[0];
  cards = strip.getElementsByTagName('LI');
  gotoCard(0);
                        
                        
  // find all sexps and circevalsexps and assign onClick handlers
  var circles = document.getElementsByClassName('circleevalsexp'),
      codes   = document.getElementsByClassName('codesexp');
  for(var i=0; i<circles.length; i++){
    circles[i].onclick = function(){this.className = (this.className=="codesexp")? "circleevalsexp" : "codesexp";};
  }
  for(var i=0; i<codes.length; i++){
    codes[i].onclick = function(){this.className = (this.className=="codesexp")? "circleevalsexp" : "codesexp";};
  }

  
});

function gotoCard(cardNum){
  var width = cards[0].offsetWidth;
  if(cardNum < 0 || cardNum > cards.length-1) return;
  document.getElementById('prev').disabled = (cardNum <= 0);
  document.getElementById('next').disabled = (cardNum == cards.length-1);
  strip.style.left = (-cardNum * width) + 'px';
  cardNumber = cardNum;
}

function nextCard(){gotoCard(cardNumber+1);}
function prevCard(){gotoCard(cardNumber-1);}

function showTeacherNotes(elt){
  parentStrip = elt.parentNode.parentNode.getElementsByTagName('ul')[0];
  parentStrip.className = (parentStrip.className == 'lesson')? 'lesson teacherNotes' : 'lesson';
//  var strips = document.getElementsByClassName('lesson');
//  for(var i=0; i< strips.length; i++)
//    strips[i].className = (strips[i].className == 'lesson')? 'lesson teacherNotes' : 'lesson';
}