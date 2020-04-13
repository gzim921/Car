require 'car/version'

module Car
  class MyCar
    SPEED_OFFSET = 15

    attr_accessor :model, :color, :current_speed
    attr_reader :year, :defects

    def initialize(model, year, color)
      @model = model
      @year = year
      @color = color
      @current_speed = 0
      @defects = []
    end

    def speed_up(increase = SPEED_OFFSET)
      @current_speed += increase
    end

    def slow_down(decrease = SPEED_OFFSET)
      @current_speed -= decrease
    end

    def spray_paint(arg)
      @color = arg
    end

    def add_defect(defect)
      @defects.push(defect)
    end

    def service_info
      defect = @defects.join(', ')
      "Defects to be fixed: #{defect}"
    end

    def repair(defect)
      @defects.delete(defect)
    end
  end
end
