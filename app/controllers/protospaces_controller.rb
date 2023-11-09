class ProtospacesController < ApplicationController
    def index
        @prototype = Prototype.all        
    end
    def new
        @prototype = Prototype.new
    end

end
