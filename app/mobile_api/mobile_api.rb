class MobileApi < Grape::API
  format :json
  prefix :mobile
  version '1', using: :param, parameter: 'v'

  mount ProductsApi
  add_swagger_documentation(
     mount_path: 'swagger_doc'
  )
end