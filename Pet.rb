class Pet
    #constructor
    def initialize(name,code,lenght,width)
        @name=name
        @code=code
        @lenght=lenght
        @width=width
    end
    #getter
    attr_reader :name, :code, :lenght, :width
end

class Box
    #contructor
    def initialize(code,lenght,width)
        @code=code
        @lenght=lenght
        @width=width
    end
    #getter
    attr_reader :code, :lenght, :width

    def identify_box(lenght,width,boxes)
        for box in boxes
            if(box.lenght>=lenght or box.width>=lenght)
                if(box.lenght>=width or box.width>=width)
                    return box.code
                end
            end
        end
    end
end

rat = Pet.new("Rat","R",20,20);
hedgehog = Pet.new("HedgeHog","H",20,20)
mongoose = Pet.new("Mongoose","M",40,20)
snake = Pet.new("Snake","S",40,20)

b1 = Box.new("B1",20,20)
b2 = Box.new("B2",40,20)
b3= Box.new("B3",40,40)

@pets=Array[rat,hedgehog,mongoose,snake]
@boxes=Array[b1,b2,b3]

puts "input a pet code"
pet_code = gets
puts "you entered " + pet_code
for pet in @pets
    if (pet.code).eql? pet_code.strip().upcase()
        puts "found match "+pet.name
        puts @boxes[0].identify_box(pet.lenght,pet.width,@boxes)
        return
    end
end