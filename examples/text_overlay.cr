require "./../src/tui/*"
require "./../src/tui/backend/*"

{% for back_class in TUI::Backend.all_subclasses %}
  backend = {{back_class}}.new
  overlay = TUI::Overlay.new

  bg = TUI::Custom.new
  bg.proc = ->(s : TUI::Surface) do
    s.w.times do |w|
      s.h.times do |h|
        c = TUI::Cell.new
        c.char = 'b'
        s[{w, h}] = c
      end
    end
    s
  end
  overlay.background = bg

  fg = TUI::Label.new("Dip can provide benefits!")

  overlay.foreground = fg
  overlay.anchor = TUI::Anchor::Center

  err = nil
  begin
    backend.start
    surface = TUI::Surface.new(backend.width, backend.height)
    overlay.paint(surface).print(backend)
    sleep 2.5
    polled = backend.poll
  rescue ex
    err = ex
  ensure
    backend.stop
  end

  p err if err
  pp err.backtrace if err

  p polled
  pp polled

{% end %}
