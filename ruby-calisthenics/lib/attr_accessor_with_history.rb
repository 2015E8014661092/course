# coding: utf-8
class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    # class_eval %Q{
    #   def #{attr_name}_history
    #     @#{attr_name}_history || [nil] # give default value if not assigned
    #   end

    #   def #{attr_name}=(new_value)
    #     @#{attr_name}_history ||= [nil] # shortcut, compare to your line
    #     @#{attr_name}_history << @#{attr_name} = new_value
    #   end
    # }
    define_method "#{attr_name}_history" do
      instance_variable_get("@#{attr_name}_history") || nil
    end

    define_method "#{attr_name}=" do |new_value|
      # 先获取上一个历史和属性当前值，如果当前值为
      v = instance_variable_get("@#{attr_name}_history")
      v ||= []
      w = instance_variable_get("@#{attr_name}")
      v << w

      instance_variable_set("@#{attr_name}_history", v)
      instance_variable_set("@#{attr_name}", new_value)
    end
  end
end
