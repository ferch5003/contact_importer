module ContactFilesHelper
  STATUS_COLORS = {
    'on_hold' => 'bg-primary',
    'processing' => 'bg-info',
    'failed' => 'bg-danger',
    'finished' => 'bg-success'
  }.freeze

  def badge_status_color(status: 'on_hold')
    STATUS_COLORS[status]
  end
end
