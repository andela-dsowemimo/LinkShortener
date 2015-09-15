module LinksHelper
  def get_link_creator_name(link)
     link.user ? link.user.name : "Anonymous"
  end
end
