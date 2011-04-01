module SaveMe  
  def self.included(klass)
    klass.extend(ClassMethods)
    klass.instance_variable_set(:@users, [])    
  end
  
  module ClassMethods
    include Enumerable
    
    def method_added(name)
    end

    def each
      @users.each {|obj| yield obj}
    end
    
    def method_missing(method_sym,*args, &block)
    end

    def define_method(name)
       
    end

    def call_if_or_unless(condition, method, obj)
     
    end

    

    def define_writer(name) 
     
    end  


    def save_user(user)
     
    end

    def create(*args, &block)
    end
   

    def validate_user(user)
   
    end


    def find(index)
      @users[index-1] if @users
    end
    
    def all
      @users
    end

  end

  def errors=(*err)
    @errors ||= {}
    @errors[*err[0][0]] = *err[0][1]    
  end

  def errors
    @errors
  end
  
  def method_missing(method_sym, *args, &block)
    
  end

  def save
  end

end

