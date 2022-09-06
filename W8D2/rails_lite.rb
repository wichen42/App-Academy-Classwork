require 'rack'
require 'byebug'

most_basic_app = Proc.new do
    [
        '200',
        {'Content-Type' => 'text/html'},
        ['This is the most basic rack app.']
    ]
end

less_basic_app = Proc.new do |env|
    p env
    response = Rack::Response.new
    res.write("Hey Programmers") # points to body
    res.finish # returns the array
end

class MyController
    def execute(req, res)
        if req.path == '/cats'
            res.write('Hello cats')
        elsif req.path == '/dogs'
            res.status = '302'
            res.location = '/cats'
        elsif req.path == 'html'
            res.write("<h1>HTML is just a string after all...</h1>")
        else
            res.write('Hey Programmers')
        end
    end
end

class betterController
    def initialize(req, res)
        @req = req
        @res = res
    end

    def render_content(content, content_type = 'text/html')
        @res.write(content)
        @res['Content-Type'] = content_type
        nil
    end

    def redirect_to(url)
        @res.status = 302
        @res['Location'] = url
        nil
    end

    def execute
        if @req.path == '/cats'
            render_content "hello cats!"
        elsif @req.path == '/dogs'
            #@res.status = '302'
            #@res.location = '/cats'
            redirect_to "/cats"
        elsif req.path == 'html'
            #@res.write("<h1>HTML is just a string after all...</h1>")
            render_content "<strong>Hello html</strong>"
        elsif @req.path == '/json'
            render_content("{1: {id: 1, title: 'heya'}}", "JSON")
        else
            render_content 'Hey Programmers'
        end
    end
end

app = Proc.new do |env|
    req = Rack::Request.new(env)
    res = Rack::Response.new
    betterController.new(req, res).execute
    res.finish
end

Rack::Server.start({
    app: app,
    Port: 3000

})