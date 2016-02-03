<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="UTF-8"/>





 <div id="slideShowImages" style="width: 100%;height: 100%;">
    <img src="image/daily1.jpg" alt="Slide 1" style="width: 100%;"/>
    <img src="image/daily2.png" alt="Slide 2" style="width: 100%;"/>
    <img src="image/daily3.png" alt="Slide 3" style="width: 100%;"/>    
    <img src="image/daily4.png" alt="Slide 4" style="width: 100%;"/>
  </div>  
  <script>
window.addEventListener('load', slideShow, true);

function slideShow() {
  
  /* GLOBALS **********************************************************************************************/
  
  var globals = {
    slideDelay: 4000, // The time interval between consecutive slides.
    fadeDelay: 35, // The time interval between individual opacity changes. This should always be much smaller than slideDelay.  
    wrapperID: "slideShowImages", // The ID of the <div> element that contains all of the <img> elements to be shown as a slide show.
    buttonID: "slideShowButton", // The ID of the <button> element that toggles the slide show on and off.
    buttonStartText: "Start Slides", // Text used in the slide show toggle button.
    buttonStopText: "Stop Slides", // Text used in the slide show toggle button.    
    wrapperObject: null, // Will contain a reference to the <div> element that contains all of the <img> elements to be shown as a slide show.
    buttonObject: null, // If present, will contain a reference to the <button> element that toggles the slide show on and off. The initial assumption is that there is no such button element (hence the false value).
    slideImages: [], // Will contain all of the slide image objects.
    slideShowID: null, // A setInterval() ID value used to stop the slide show.
    slideShowRunning: true, // Used to record when the slide show is running and when it's not. The slide show is always initially running.    
    slideIndex: 0 // The index of the current slide image.
  }
  
  /* MAIN *************************************************************************************************/
  
  initializeGlobals();  
  
  if ( insufficientSlideShowMarkup() ) {
    return; // Insufficient slide show markup - exit now.
  }
 
   // Assert: there's at least one slide image.
 
  if (globals.slideImages.length == 1) {
    return; // The solo slide image is already being displayed - exit now.
  }
  
  // Assert: there's at least two slide images.
  
  initializeSlideShowMarkup();
  
  globals.wrapperObject.addEventListener('click', toggleSlideShow, false); // If the user clicks a slide show image, it toggles the slide show on and off.
  
  if (globals.buttonObject) {
    globals.buttonObject.addEventListener('click', toggleSlideShow, false); // This callback is used to toggle the slide show on and off.
  } 
  
  startSlideShow();
  
  /* FUNCTIONS ********************************************************************************************/
  
  function initializeGlobals() {   
    globals.wrapperObject = (document.getElementById(globals.wrapperID) ? document.getElementById(globals.wrapperID) : null);
    globals.buttonObject = (document.getElementById(globals.buttonID) ? document.getElementById(globals.buttonID) : null);   
    
    if (globals.wrapperObject) {
      globals.slideImages = (globals.wrapperObject.querySelectorAll('img') ? globals.wrapperObject.querySelectorAll('img') : []);
    }
  } // initializeGlobals
  
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  function insufficientSlideShowMarkup() {
    if (!globals.wrapperObject) { // There is no wrapper element whose ID is globals.wrapperID - fatal error.
      if (globals.buttonObject) {
        globals.buttonObject.style.display = "none"; // Hide the not needed slide show button element when present.
      }
      return true;
    }

    if (!globals.slideImages.length) { // There needs to be at least one slide <img> element - fatal error.
      if (globals.wrapperObject) {
        globals.wrapperObject.style.display = "none"; // Hide the not needed <div> wrapper element.
      }
    
      if (globals.buttonObject) {
        globals.buttonObject.style.display = "none"; // Hide the not needed slide show button element.
      }
    
      return true;
    }
    
    return false; // The markup expected by this library seems to be present.
  } // insufficientSlideShowMarkup
  
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  function initializeSlideShowMarkup() {  
    var slideWidthMax = maxSlideWidth(); // Returns a value that is always in pixel units.
    var slideHeightMax = maxSlideHeight(); // Returns a value that is always in pixel units.
    
    globals.wrapperObject.style.position = "relative";
    globals.wrapperObject.style.overflow = "hidden"; // This is just a safety thing.
    globals.wrapperObject.style.width = slideWidthMax + "px";
    globals.wrapperObject.style.height = slideHeightMax + "px";
    
    var slideCount = globals.slideImages.length;
    for (var i = 0; i < slideCount; i++) { 
      globals.slideImages[i].style.opacity = 0;
      globals.slideImages[i].style.position = "absolute";
      globals.slideImages[i].style.top = (slideHeightMax - globals.slideImages[i].getBoundingClientRect().height) / 2 + "px";   
      globals.slideImages[i].style.left = (slideWidthMax - globals.slideImages[i].getBoundingClientRect().width) / 2 + "px";               
    }
    
    globals.slideImages[0].style.opacity = 1; // Make the first slide visible.
        
    if (globals.buttonObject) {
      globals.buttonObject.textContent = globals.buttonStopText;
    }
  } // initializeSlideShowMarkup
  
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    
  function maxSlideWidth() {
    var maxWidth = 0;
    var maxSlideIndex = 0;
    var slideCount = globals.slideImages.length;
    
    for (var i = 0; i < slideCount; i++) {
      if (globals.slideImages[i].width > maxWidth) {
        maxWidth = globals.slideImages[i].width; // The width of the widest slide so far.
        maxSlideIndex = i; // The slide with the widest width so far.
      }
    }

    return globals.slideImages[maxSlideIndex].getBoundingClientRect().width; // Account for the image's border, padding, and margin values. Note that getBoundingClientRect() is always in units of pixels.
  } // maxSlideWidth
  
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    
  function maxSlideHeight() {
    var maxHeight = 0;
    var maxSlideIndex = 0;    
    var slideCount = globals.slideImages.length;
    
    for (var i = 0; i < slideCount; i++) {
      if (globals.slideImages[i].height > maxHeight) {
        maxHeight = globals.slideImages[i].height; // The height of the tallest slide so far.
        maxSlideIndex = i; // The slide with the tallest height so far.
      }
    }
    
    return globals.slideImages[maxSlideIndex].getBoundingClientRect().height; // Account for the image's border, padding, and margin values. Note that getBoundingClientRect() is always in units of pixels.
  } // maxSlideHeight

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  function startSlideShow() {
    globals.slideShowID = setInterval(transitionSlides, globals.slideDelay);                
  } // startSlideShow

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  
  function haltSlideShow() {
    clearInterval(globals.slideShowID);   
  } // haltSlideShow

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  
  function toggleSlideShow() {
    if (globals.slideShowRunning) {
      haltSlideShow();
      if (globals.buttonObject) { 
        globals.buttonObject.textContent = globals.buttonStartText; 
      }
    }
    else {
      startSlideShow();
      if (globals.buttonObject) { 
        globals.buttonObject.textContent = globals.buttonStopText; 
      }            
    }
    globals.slideShowRunning = !(globals.slideShowRunning);
  } // toggleSlideShow
  
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  function transitionSlides() {
    var currentSlide = globals.slideImages[globals.slideIndex];
    
    ++(globals.slideIndex);
    if (globals.slideIndex >= globals.slideImages.length) {
      globals.slideIndex = 0;
    }
    
    var nextSlide = globals.slideImages[globals.slideIndex];
    
    var currentSlideOpacity = 1; // Fade the current slide out.
    var nextSlideOpacity = 0; // Fade the next slide in.
    var opacityLevelIncrement = 1 / globals.fadeDelay;
    var fadeActiveSlidesID = setInterval(fadeActiveSlides, globals.fadeDelay);
    
    function fadeActiveSlides() {
      currentSlideOpacity -= opacityLevelIncrement;
      nextSlideOpacity += opacityLevelIncrement;
      
      // console.log(currentSlideOpacity + nextSlideOpacity); // This should always be very close to 1.
      
      if (currentSlideOpacity >= 0 && nextSlideOpacity <= 1) {
        currentSlide.style.opacity = currentSlideOpacity;
        nextSlide.style.opacity = nextSlideOpacity; 
      }
      else {
        currentSlide.style.opacity = 0;
        nextSlide.style.opacity = 1; 
        clearInterval(fadeActiveSlidesID);
      }        
    } // fadeActiveSlides
  } // transitionSlides
  
} // slideShow
</script>


<div style="height:0px;width:100%;overflow:visible;z-index:2000;font-size:0px;line-height: 0px;"><div style="position:relative;margin:0px;padding:0px;display:inline-block;height:0px;overflow:visible;z-index:2000;width:250px;"><a href="//info.widerplanet.com/ad_page.php?lid=18511&campaignid=78090&zoneid=18504&c_type=201" target="_blank" style="position:absolute;top:0px;right:0px;display:inline-block;z-index:3000;overflow:hidden;border:0px; width:49px;height:14px;"> <img src="//cdn-aitg.widerplanet.com/images/tgad_globe.png" onmouseover="this.style.marginLeft='-14px';" onmouseout="this.style.marginLeft='35px';" style="margin-left:35px;" border="0"></a></div></div><a href='//altg.widerplanet.com/delivery/ck.php?oaparams=2__cb=7e0e291f9c__lid=18511__bannerid=603657__cid=454431__campaignid=78090__campaigngroupid=0__zoneid=18504__dlid=a6cb8857acb383c3444ed6c54a00971914543901406717350703__rv=46__rvt=2__zc=9n80__zct=5__ctype=201__ft=0__arehn=057__host=www__domain=soccerline.co.kr__category=1005260%5E%5E__OXLCA=1__oadest=http%3A%2F%2Fwww.abcmart.co.kr%2Fabc%2FplanDisp%2Fdetail%3FplndpId%3D001804&qsc=1039ze4' title='advertise' target='_blank' ><span style='display:none;'></span><img src='//cdn-aitg.widerplanet.com/images/wp/aa/4e/aa96a03e4baf5d9947e1e83e2d1f164e.jpg' width='250' height='250' alt='' title='' border='0'  /></a><div id='beacon_8e8ba97226' style='position: absolute; left: 0px; top: 0px; visibility: hidden;'><img src='//altg.widerplanet.com/delivery/lg.php?cb=b8bd3c7d3e&amp;lid=18511&amp;bannerid=603657&amp;cid=454431&amp;campaignid=78090&amp;campaigngroupid=0&amp;zoneid=18504&amp;dlid=a6cb8857acb383c3444ed6c54a00971914543901406717350703&amp;rv=46&amp;rvt=2&amp;zc=9n80&amp;zct=5&amp;ctype=201&amp;ft=0&amp;arehn=057&amp;host=www&amp;domain=soccerline.co.kr&amp;category=1005260%5E%5E&amp;ii=1&amp;OABLOCK=1200&amp;OACAP=15&amp;OXLIA=1&amp;qsc=gn1hex' width='0' height='0' alt='ad' style='width: 0px; height: 0px;' /></div>
