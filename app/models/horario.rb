class Horario < ActiveRecord::Base
  def to_s
    "#{I18n.t('date.day_names')[dia - 1]}, #{hora}"
  end
end
