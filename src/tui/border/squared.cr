struct TUI::Border::Squared < TUI::Border
  def paint(painter : Painter)
    painter.hline(1, 0, painter.w-1, '─')
    painter.hline(1, -1, painter.w-1, '─')
    painter.vline(0, 1, painter.h-1, '│')
    painter.vline(-1, 1, painter.h-1, '│')
    painter[0, 0] = '┌'
    painter[-1, 0] = '┐'
    painter[-1, -1] = '┘'
    painter[0, -1] = '└'
    # Would raise if width or height - 2 is negative
    painter.push(1, 1, Math.max(0, painter.w-2), Math.max(0, painter.h-2))
  end

  def width : Int32
    2
  end

  def height : Int32
    2
  end

  def width(h) : Int32
    2
  end

  def height(w) : Int32
    2
  end
end
