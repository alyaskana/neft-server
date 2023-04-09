module ChannelHelper
  def render_view(params)
    # renderer = ActionController::Renderer.for(Api::GamesController).with_defaults({ http_host: 'localhost',
    #                                                                                 http_port: 3000 })
    renderer = ActionController::Renderer.for(Api::GamesController)
    renderer.instance_variable_set(:@env,
                                   { 'HTTP_HOST' => 'localhsot:3000',
                                     'HTTPS' => 'off',
                                     'REQUEST_METHOD' => 'GET',
                                     'SCRIPT_NAME' => '', '
                                     rack.input' => '',
                                     'rack.url_scheme' => 'http' })
    Api::GamesController.render(params)
  end

  def render_json(params)
    JSON.parse(render_view(params))
  end
end
