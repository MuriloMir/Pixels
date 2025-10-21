// This software is an artwork, it creates a screen full of pixels changing color.

// import all the tools we need
import multimedia.display : Color, Point, ScreenPainter, SimpleWindow;
import std.random : choice, uniform;

// this function will paint on a portion of the screen using a list of colors
void paint(int xBegin, int xEnd, int yBegin, int yEnd, Color[] colors, ScreenPainter painter)
{
    // start a loop to use all y coordinates
    foreach (y; yBegin .. yEnd)
        // start a loop to use all x coordinates
        foreach (x; xBegin .. xEnd)
        {
            // if this square isn't using an array of colors
            if (colors is null)
                // set up a random color by selecting random values for R, G and B
                painter.outlineColor = Color(uniform(0, 256), uniform(0, 256), uniform(0, 256));
            // if it is using one of the arrays of colors
            else
                // choose a random color out of the array
                painter.outlineColor = choice(colors);

            // draw the pixel with the random color
            painter.drawPixel(Point(x, y));
        }
}

// start the software
void main()
{
    // create the window for the GUI
    SimpleWindow window = new SimpleWindow(800, 800, "Pixels");
    // create our own colors
    Color golden = Color(255, 213, 0), rufous = Color(153, 25, 0), tawny = Color(204, 102, 0), tangerine = Color(255, 179, 25),
          jasmine = Color(255, 234, 128), icterine = Color(229, 255, 102), neonGreen = Color(77, 255, 77), aqua = Color(0, 255, 255),
          mayaBlue = Color(77, 195, 255), ultraPink = Color(255, 77, 255);
    // create an array with strong colors
    Color[5] allStrongColors = [Color.blue(), Color.green(), Color.magenta(), Color.purple(), Color.red()];
    // create an array with the predefined colors
    Color[8] allPredefinedColors = allStrongColors ~ [Color.brown(), Color.teal(), Color.yellow()];
    // create an array with all colors
    Color[18] allColors = allPredefinedColors ~ [golden, rufous, tawny, tangerine, jasmine, icterine, neonGreen, aqua, mayaBlue, ultraPink];

    // start the event loop
    window.eventLoop(500,
    {
        // create the painter
        ScreenPainter painter = window.draw();
        // call this function 4 times, so it draws 4 different squares
        paint(0, 400, 0, 400, null, painter), paint(400, 800, 0, 400, allStrongColors, painter), paint(400, 800, 400, 800, allPredefinedColors, painter),
            paint(0, 400, 400, 800, allColors, painter);
    });
}
