# Provides a surface that can be drawn on
#
# Can create sub-surface on part of the surface
struct TUI::Surface
  property! size : Tuple(Int32, Int32)

  @cells = {} of {Int32, Int32} => Cell

  def initialize(x, y)
    @size = {x, y}
  end

  def w : Int32
    size[0]
  end

  def h : Int32
    size[1]
  end

  protected def sub(w, h, x = 0, y = 0, &block)
    s = TUI::Surface.new(w, h)
    yield s
    s.w.times do |w|
      s.h.times do |h|
        newval = s.@cells[{w, h}]?
        @cells[{w+x, h+y}] = newval if newval
      end
    end
  end

  protected def print(backend : TUI::Backend)
    h.times do |h|
      w.times do |w|
        v = @cells[{w, h}]?
        backend.draw(v, w, h) if v
      end
    end
    backend.refresh
  end
end
