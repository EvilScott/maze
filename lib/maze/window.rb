module Maze
  class Window < ::Gosu::Window

    def initialize
      super(640, 480, false)
      self.caption = 'Maze'
      @font = Gosu::Font.new(self, Gosu::default_font_name, 15)
    end

    def needs_cursor?
      true
    end

    def load!(walls, hero)
      @walls, @hero = walls, hero
    end

    def update
      @hero.move!(:forward) if button_down? Gosu::KbW
      @hero.move!(:back) if button_down? Gosu::KbS
      @hero.move!(:left) if button_down? Gosu::KbA
      @hero.move!(:right) if button_down? Gosu::KbD
    end

    def draw
      if $debug
        @font.draw('X: ' + @hero.x.round(2).to_s, 10, 10, 1)
        @font.draw('X-Speed: ' + Math.cos(@hero.mouse_angle).round(2).to_s, 10, 20, 1)
        @font.draw('Y: ' + @hero.y.round(2).to_s, 10, 30, 1)
        @font.draw('Y-Speed: ' + Math.sin(@hero.mouse_angle).round(2).to_s, 10, 40, 1)
        @font.draw('Angle: ' + @hero.mouse_angle.round(2).to_s, 10, 50, 1)
      end
      @hero.render
      @walls.each(&:render)
    end

    def button_down(id)
      close if id == Gosu::KbEscape
    end

  end
end