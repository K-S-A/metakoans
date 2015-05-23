class Module
  def attribute(a, &block)
    a, val = a.keys.first, a.values.first if a.kind_of?(Hash)
    ivar = "@#{a}".to_sym
    define_method(a) do
       case
       when instance_variables.include?(ivar) then instance_variable_get(ivar)
       when block                             then instance_eval(&block)
       else val
       end
     end
    define_method("#{a}?") { self.a }
    attr_writer a.to_sym
  end
end
