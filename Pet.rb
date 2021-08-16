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
snake = Pet.new("Snake","S",40,30)

b1 = Box.new("B1",20,20)
b2 = Box.new("B2",40,20)
b3= Box.new("B3",40,40)

@pets=Array[rat,hedgehog,mongoose,snake]
@boxes=Array[b1,b2,b3]
@ship_box=Array.new
puts "input a pet codes"
pet_codes = gets
for pet_code in pet_codes.split(',')
    #puts "finding for "+pet_code
    for pet in @pets
        if (pet.code).eql? pet_code.strip().upcase()
            #puts "found match "+pet.name
            @ship_box << pet.lenght * pet.width
            #@ship_box << @boxes[0].identify_box(pet.lenght,pet.width,@boxes)
        end
    end
end
count1200=@ship_box.count(1200)
count800=@ship_box.count(800)
count400=@ship_box.count(400)
containers=""
if count1200>=count400
    while count1200 >=1
        containers=containers+"B3 "
        count1200=count1200-1
    end
    while count800>=2
        containers=containers+"B3 "
        count800=count800-2
    end
    if(count800==1)
        containers=containers+"B2 "
    end
else
    count400=count400-count1200
    while count1200 >=1
        containers=containers+"B3 "
        count1200=count1200-1
    end
    while count800>=2
        containers=containers+"B3 "
        count800=count800-2
    end
    while count400>=4
        containers=containers+"B3 "
        count400=count400-4
    end
    if count800==1
        if count400>=2
            containers=containers+"B3 "
            count800=count800-1
            count400=count400-2
        else
            containers=containers+"B2 "
            count800=count800-1
            if(count400==1)
                containers=containers+"B1 "
                count400=count400-1
            end
        end
    end
    while count400>=4
        containers=containers+"B3 "
        count400=count400-4
    end
    while count400>=2
        containers=containers+"B2 "
        count400=count400-2
    end
    if(count400==1)
        containers=containers+"B1 "
        count400=count400-1
    end
end
puts "required boxes are"
puts containers




    
