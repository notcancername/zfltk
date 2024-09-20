const c = @import("zfltk").c;

// fltk initizialization of optional functionalities
pub fn fltkInit() void {
    c.Fl_init_all(); // inits all styles, if needed
    c.Fl_register_images(); // register image types supported by fltk, if needed
    _ = c.Fl_lock(); // enable multithreading, if needed
}

// Button callback
pub fn butCb(w: ?*c.Fl_Widget, data: ?*anyopaque) callconv(.C) void {
    c.Fl_Box_set_label(@ptrCast(data), "Hello World!");
    c.Fl_Button_set_color(@ptrCast(w), c.Fl_Color_Cyan);
}

pub fn main() !void {
    fltkInit();

    _ = c.Fl_set_scheme("gtk+");
    const win = c.Fl_Window_new(100, 100, 400, 300, "Hello");
    const but = c.Fl_Button_new(160, 220, 80, 40, "Click me!");
    const box = c.Fl_Box_new(10, 10, 380, 180, "");
    c.Fl_Box_set_box(box, c.Fl_BoxType_UpBox);
    c.Fl_Box_set_label_size(box, 18);
    c.Fl_Box_set_label_font(box, c.Fl_Font_Courier);
    c.Fl_Window_end(win);
    c.Fl_Window_show(win);
    c.Fl_Button_set_callback(but, butCb, box);
    _ = c.Fl_run();
}
