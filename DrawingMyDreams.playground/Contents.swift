//#-hidden-code
import PlaygroundSupport
import UIKit
let model = DataModel.shared
//#-end-hidden-code
//#-code-completion(literal, show, color)

/*:
 # DrawingMyDreams
 
 ## Motivation
 
As a child I loved to draw and paint, not enough paper and cardboard, which made use  the wall of my mother's house, making her extremely angry, but she was understanding knowing that I was putting my creativity into practice.
 
 When I was older, at puberty, I used drawing to express myself and release accumulated emotions like when I was happy, angry, stressed, tired and in love.
 
 Currently, I have been using drawing as a way to have ideas for new projects as well as to relax the body and the thoughts. I can say that it has helped me a lot to plan my future by setting my goals for my dreams.
 
 So I'd like to share with you this technique I've been using since I was a kid.
 
 This is a project to develop **creativity** along with **release of emotions** so that we can achieve our goals.
 
 Play and have fun.
 
 Then read the topics below.
 
 ## How to Use
 
This playground can be used in two ways: to create scenes with motion effects and to paint freely.
 
When creating effects, you can select the thickness of the pencil, the color and the layer, plus the time and type of effect by the code.
 
In painting freely mode, I suggest that you select the Bug button to increase the experience.
 
 ## Let's do it
 
Now that we know a little more what this playground is we can make some changes to the code.
 
Remember, from that moment you are a professional programmer and so you should not be afraid to make changes and see what happens.
 
Make every possible change in the code on this page and try to understand what is really happening.
 
If you still have questions or want to know a little more about programming I leave my contact and useful links at the end of this page.
 
Enjoy yourself!
 
 */

/*:
 
 ### Variables
 
 A variable is like a small box that receives a content.
 
 In swit we can declare it as let or var.
 
 * let is a variable declaration that will not change in content later.
 * var is a variable declaration that will possibly be changed.
 */

/*:
 - Note: Here we declare a Boolean variable that can only contain true or false.
 */

let introIsActive = /*#-editable-code*/true/*#-end-editable-code*/

/*:
 - Note: backgroundColor is a variable that gets a color. It will be the background color of the view if our gradient is not active.
 */

let backgroundColor = /*#-editable-code*/#colorLiteral(red: 0.9921568627, green: 0.7215686275, blue: 0.1529411765, alpha: 1)/*#-end-editable-code*/

/*:
 - Experiment: Try to enable or disable the effect that removes the onscreen buttons with the double tap.
 */

let twoTapsRecognizerIsActive =  /*#-editable-code*/true/*#-end-editable-code*/

/*:
 - Note: We can also change the size of the buttons. Try to put a low value and then a high and see what happens.
 */

let sizeButtons = /*#-editable-code*/50/*#-end-editable-code*/

/*:
 ### Arrays
 
A array is like a list of variables. Each position is numbered, starting at 0. We can create arrays of all kinds: colors, numbers, words, elements.
 
 ### Abbreviations
 
 An earlier point to a word serves as an abbreviation for the type.
 
 Instead of putting UIColor.black we use .black for easier reading and code reduction.
 
 */

/*:
 - Note: Here we have a UIColor color array. The amount of colors will influence the number of buttons used in the application.
 */


let color:[UIColor] = /*#-editable-code*/[.black, .gray, .red, .green, .blue, .white, .orange, .brown, .yellow]/*#-end-editable-code*/

/*:
 - Experiment: Remove or add some colors and see what will happen!
 */

/*:
 ### lineWidths
 
 It is a array of Int (Integers numbers) those that do not have punctuation.
 
 In it we pass a sequence of numbers that are the thickness of the lines that we want to use.
 
 As in the color vector the amount of parameters we insert influence the amount of buttons generated when we play in the playground.
 
 */

let lineWidths:[Int] = /*#-editable-code*/[1,3,5,7,9,11,13]/*#-end-editable-code*/

/*:
 ### borderDrawViewColor
 
 Sets the border color of animated views.
 
 It receives a UIColor property that contains the red, green, blue, and Alpha parameters.
 
 They receive floating point values (those containing points) from 0.0 to 1.0.
 
 Each combination of red, green and blue values (RGB) defines a color along with its opacity / translucency (alpha).
 */

let borderDrawViewColor = UIColor(red: /*#-editable-code*/1.0/*#-end-editable-code*/, green: /*#-editable-code*/0.0/*#-end-editable-code*/, blue: /*#-editable-code*/0.0/*#-end-editable-code*/, alpha: /*#-editable-code*/0.0/*#-end-editable-code*/)

//#-hidden-code
model.borderDrawViewColor = borderDrawViewColor
//#-end-hidden-code
//#-code-completion(literal, show, color)

/*:
 - Experiment:  Try changing the UIColor values and see the resulting colors and what will change in the application.
 */

/*:
 ### backgroundColorView
 
 Sets the background color of each view that we will use.
 
 Check that if the alpha is 1.0 you can not see the overlap of views so only the top is apparent.
 */

let backgroundColorView = UIColor(red: /*#-editable-code*/0.5/*#-end-editable-code*/, green: /*#-editable-code*/0.2/*#-end-editable-code*/, blue: /*#-editable-code*/0.6/*#-end-editable-code*/, alpha: /*#-editable-code*/0.0/*#-end-editable-code*/)
/*:
 
 ## Animations Views
 
 Now we will define each view we want in our app.
 
 To do this, we need to pass the translationType, duration, and backgroundColor as the DrawViewEffect parameter.
 
 In translationType we can have 6 types of cases:
 
 ## Translations Types
 * .rotation1
 * .rotation2
 * .horizontal
 * .vertical
 * .diagonal1
 * .diagonal2

 
 Remember the colors we used to score on the front for short?! We will do the same.
 
 Instead of using TranslationType.horizontal we will only use .horizontal.

 In duration we define the total time that will be used to go through the View variation.

 In backgroundColor we will define the background color of each view.
 */

let myDrawView1 = DrawViewEffect(translationType: /*#-editable-code*/.rotation1/*#-end-editable-code*/, duration: /*#-editable-code*/5.0/*#-end-editable-code*/, backgroundColor:/*#-editable-code*/ backgroundColorView/*#-end-editable-code*/)

let myDrawView2 = DrawViewEffect(translationType: /*#-editable-code*/.rotation2/*#-end-editable-code*/, duration: /*#-editable-code*/7.0/*#-end-editable-code*/, backgroundColor: /*#-editable-code*/backgroundColorView/*#-end-editable-code*/)

let myDrawView3 = DrawViewEffect(translationType:/*#-editable-code*/ .horizontal/*#-end-editable-code*/, duration: /*#-editable-code*/5.0/*#-end-editable-code*/, backgroundColor:  /*#-editable-code*/backgroundColorView/*#-end-editable-code*/)

let myDrawView4 = DrawViewEffect(translationType: /*#-editable-code*/.vertical/*#-end-editable-code*/, duration: /*#-editable-code*/5.0/*#-end-editable-code*/, backgroundColor: /*#-editable-code*/backgroundColorView/*#-end-editable-code*/)

let myDrawView5 = DrawViewEffect(translationType: /*#-editable-code*/.diagonal1/*#-end-editable-code*/, duration: /*#-editable-code*/5.0/*#-end-editable-code*/, backgroundColor:/*#-editable-code*/ backgroundColorView/*#-end-editable-code*/)

let myDrawView6 = DrawViewEffect(translationType: /*#-editable-code*/.diagonal2/*#-end-editable-code*/, duration: /*#-editable-code*/5.0/*#-end-editable-code*/, backgroundColor: /*#-editable-code*/backgroundColorView/*#-end-editable-code*/)

let myDrawView7 = DrawViewEffect(translationType: /*#-editable-code*/.diagonal2/*#-end-editable-code*/, duration: /*#-editable-code*/5.0/*#-end-editable-code*/, backgroundColor: /*#-editable-code*/backgroundColorView/*#-end-editable-code*/)

let myDrawView8 = DrawViewEffect(translationType: /*#-editable-code*/.diagonal2/*#-end-editable-code*/, duration: /*#-editable-code*/5.0/*#-end-editable-code*/, backgroundColor: /*#-editable-code*/backgroundColorView/*#-end-editable-code*/)

let myDrawView9 = DrawViewEffect(translationType: /*#-editable-code*/.diagonal2/*#-end-editable-code*/, duration: /*#-editable-code*/5.0/*#-end-editable-code*/, backgroundColor: /*#-editable-code*/backgroundColorView/*#-end-editable-code*/)

let myDrawView10 = DrawViewEffect(translationType: /*#-editable-code*/.diagonal2/*#-end-editable-code*/, duration: /*#-editable-code*/5.0/*#-end-editable-code*/, backgroundColor: /*#-editable-code*/backgroundColorView/*#-end-editable-code*/)


/*:
 - Experiment: Change the duration time and the translation type.
 */

/*:
 Now that we have created our view variables we can group them into a array.
 
 This vector will be used to generate the views buttons in the application.
 
 Each view will represent a button.
 */

let myDrawViews = /*#-editable-code*/[myDrawView1, myDrawView2, myDrawView3, myDrawView4, myDrawView5, myDrawView6]/*#-end-editable-code*/

/*:
 - Experiment: Try adding or removing some drawView!
 */


/*:
 - Note: You can also set whether the gradient is enabled or not.
 */

let gradientIsActive = /*#-editable-code*/true/*#-end-editable-code*/

/*:
 
 ### Gradient Colors
 
 If it is activated we can define some colors.
 
We have an animation with two gradient variations so we should declare four colors: *colorTopFrom*, *colorBottomFrom*, *colorBottomTo*, *colorTopTo* and *colorBottomTo*.
 
 After that we create two gradient array that will be used by the application. They are: *gradientColorsFrom* and *gradientColorsTo*.
 
 */

let colorTopFrom = UIColor(red: /*#-editable-code*/236/255.0/*#-end-editable-code*/, green: /*#-editable-code*/139/255.0/*#-end-editable-code*/, blue: /*#-editable-code*/20/255.0/*#-end-editable-code*/, alpha: /*#-editable-code*/1.0/*#-end-editable-code*/)


let colorBottomFrom = UIColor(red: /*#-editable-code*/225/255.0/*#-end-editable-code*/, green: /*#-editable-code*/236/255.0/*#-end-editable-code*/, blue: /*#-editable-code*/20/255.0/*#-end-editable-code*/, alpha: /*#-editable-code*/1.0/*#-end-editable-code*/)


let colorTopTo = UIColor(red: /*#-editable-code*/22.0/255.0/*#-end-editable-code*/, green: /*#-editable-code*/102.0/255.0/*#-end-editable-code*/, blue: /*#-editable-code*/186.0/255.0/*#-end-editable-code*/, alpha: /*#-editable-code*/1.0/*#-end-editable-code*/)


let colorBottomTo = UIColor(red: /*#-editable-code*/190.0/255.0/*#-end-editable-code*/, green: /*#-editable-code*/218.0/255.0/*#-end-editable-code*/, blue: /*#-editable-code*/247.0/255.0/*#-end-editable-code*/, alpha: /*#-editable-code*/1.0/*#-end-editable-code*/)

/*:
 ### Gradient Arrays
 */

let gradientColorsFrom = /*#-editable-code*/[colorTopFrom, colorBottomFrom]/*#-end-editable-code*/

let gradientColorsTo = /*#-editable-code*/[colorTopTo, colorBottomTo]/*#-end-editable-code*/

/*:
 - Experiment: Try to invert the order of the variables in the array and see what happens! You can also add more colors in the array.
 */

/*:
 
 ## Thanks
 
 I hope you had fun.
 
 If you have questions or suggestions I will leave my contact below as well as some useful links.
 
 Thank you very much and I hope to meet you one day.
 
 */

/*:
 
 ### Useful Links

 * [The source code of this app](https://bitbucket.org/mateuspereiragomes/drawingmydreams)
 
 * [Swift Language](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309)
 
 * [Playgrounds](https://www.apple.com/swift/playgrounds/)
 
 * [Gradient Colors](https://uigradients.com)
 
 * [Colors](https://htmlcolorcodes.com/color-picker/)
 
 * [More Playground Projects](https://github.com/wwdc/2017)
 
 * Contact me: mateuspereiragomes@icloud.com
 
 */

//#-hidden-code

model.introIsActive = introIsActive

model.gradientColorsFrom = gradientColorsFrom
model.gradientColorsTo = gradientColorsTo

model.colors = color

model.backgroundColor = backgroundColor

model.lineWidths = lineWidths

model.myDrawViews = myDrawViews

model.sizeButtons = sizeButtons

model.twoTapsRecognizerIsActive = twoTapsRecognizerIsActive

model.borderDrawViewColor = borderDrawViewColor

model.gradientIsActive = gradientIsActive


var vc = ViewController()

PlaygroundPage.current.liveView = vc

PlaygroundPage.current.needsIndefiniteExecution = true


//#-end-hidden-code
//#-code-completion(literal, show, color)





