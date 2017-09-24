module ApplicationHelper
  def old_paginate(current_page, per_page, total_count, method_path)
    result = ''
    per = 5
    x = 0
    y = 0
    if current_page - per < 0
      x = 1
      y = 10
    end

    temp = current_page - per
    if temp >= 0
      x = current_page - 5
      y = current_page + 4
    end
    y = (total_count / per_page).ceil if y > (total_count / per_page).ceil


    result << link_to('PREV', send(method_path, page: current_page - 1)) if current_page > 1

    (x..y).each do |i|
      result << link_to(i.to_s, send(method_path, page: i))
    end

    result << link_to('NEXT', send(method_path, page: current_page + 1)) unless total_count <= (per_page * current_page)

   raw result
  end
end
