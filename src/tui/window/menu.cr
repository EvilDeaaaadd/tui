class TUI::Window::Menu < TUI::Window
  def initialize(parent : Window? = nil)
    super
    @layout = Layout::Menu.new(self)
  end

  def layout : Layout::Menu
    @layout.as(Layout::Menu)
  end

  def layout=(l)
    unless l.is_a?(Layout::Menu)
      raise ArgumentError.new(
        "Menu layout can only be MenuLayout, not #{l.class}")
    end
    @layout = l
  end
end
