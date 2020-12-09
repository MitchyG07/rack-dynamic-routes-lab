class Application
    @@items = [Item.new("carrots", 2),Item.new("Tofu",4)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
           if  item_name = req.path.split("/items/").last 
                item = @@items.find{|item| item.name == item_name}
                resp.write item.price
            else
                resp.status = 400
                resp. write "error"
            end 
        else          
            resp.status = 404
        end 
        resp.finish
    end 


end 