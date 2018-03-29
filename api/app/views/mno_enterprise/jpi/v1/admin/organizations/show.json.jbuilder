json.organization do
  json.partial! 'organization', organization: @organization
  json.members @organization.members(true), partial: 'member', as: :member, organization: @organization
  json.partial! 'credit_card', credit_card: @organization.credit_card
  json.partial! 'invoices', organization: @organization
  json.active_apps @organization_active_apps do |instance|
    json.extract! instance, :id, :name, :stack, :uid, :status, :oauth_keys_valid
    json.app_name instance.app.name
    json.app_logo instance.app.logo
    json.nid instance.app.nid
  end
  json.active_subscriptions @organization_active_subscriptions do |subscription|
    json.extract! subscription, :id, :status
    json.product_uid subscription.product_instance.product.uid
    json.product_nid subscription.product_instance.product.nid
    json.product_name subscription.product_instance.product.name
    json.product_logo subscription.product_instance.product.logo
  end
end
