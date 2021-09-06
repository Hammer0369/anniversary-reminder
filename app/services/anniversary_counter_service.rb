class AnniversaryCounterService

  def anniversary_times_calc
    require 'happybirthday'
    birthday = Happybirthday.born_on(event.anniversary_date)
    @birthday.age.years_old
  end
end