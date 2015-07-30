module MerchantsHelper
  def status_link_text(approvable)
    approvable.status ? ' ACTIVE ' : ' INACTIVE '
  end
end
