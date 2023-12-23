alarm[0] = 1;
if (html5)
if (browser_width != width || browser_height != height)
    {
    width = browser_width;// min(base_width, browser_width);
    height =browser_height// min(base_height, browser_height);
    scale_canvas(base_width, base_height, width, height, true);
    }

