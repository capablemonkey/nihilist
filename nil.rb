ObjectSpace.each_object(Class).each do |klass|
  klass.send(:define_method, 'nil?') { nil }
  klass.send(:define_method, '==') { |_| nil }
  klass.send(:define_method, '>') { |_| nil }
  klass.send(:define_method, '<') { |_| nil }
  klass.send(:define_method, '-') { |_| nil }

  # Dangerous:
  # klass.send(:define_method, 'new') { |*p| nil }
  # klass.send(:define_method, '+') { |_| nil }
end

[true, false].each do |obj|
  obj.class.send(:define_method, :inspect) { "True, or false... does it really matter?" }
end