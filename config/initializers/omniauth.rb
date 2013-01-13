Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :twitter, 'mYCgbju6A9ovA8wp03yOA', 'L15MsBfgkGOGkoJwUaOyOQ9KIRER198ZRIT9XYxQEM'  
  provider :facebook, '585821864766485', '83e722fa3d5bda4a4b777e1e04995a3a'  
  provider :linked_in, 'nrcujto9a8gl', 'N58bp2dUBdGlyHXk'  
end  