class Module
  def attribute var, &block
    if var.is_a?(Hash)
      name = var.keys[0]
      value = var.values[0]
    else
      name = var
    end
    define_method(name) do
      @a ||= instance_eval(&block) if block_given?
      @a ||= value
    end
    define_method(name + '=') do |value|
      @a = value
    end
    define_method(name + "?") { not @a.nil? }
  end
end