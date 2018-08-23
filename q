
[1mFrom:[0m /home/derrickbozich/flatiron-bnb-methods-cb-000/app/models/city.rb @ line 21 City#city_openings:

     [1;34m8[0m: [32mdef[0m [1;34mcity_openings[0m(start_date, end_date)
     [1;34m9[0m:   start_date = [1;34;4mDateTime[0m.parse(start_date).to_date
    [1;34m10[0m:   end_date = [1;34;4mDateTime[0m.parse(end_date).to_date
    [1;34m11[0m: 
    [1;34m12[0m:   openings = []
    [1;34m13[0m:   conflicts = []
    [1;34m14[0m: 
    [1;34m15[0m:   [1;36mself[0m.listings.each [32mdo[0m |listing|
    [1;34m16[0m:     listing.reservations.each [32mdo[0m |reservation|
    [1;34m17[0m:       [32mif[0m ((start_date <= reservation.checkout)  &&  (end_date >= reservation.checkin))
    [1;34m18[0m:         conflicts << reservation
    [1;34m19[0m:       [32mend[0m
    [1;34m20[0m:     [32mend[0m
 => [1;34m21[0m:     binding.pry
    [1;34m22[0m:     [32mif[0m conflicts.empty?
    [1;34m23[0m:       openings << listing
    [1;34m24[0m:       conflicts.clear
    [1;34m25[0m:     [32mend[0m
    [1;34m26[0m:   [32mend[0m
    [1;34m27[0m: 
    [1;34m28[0m: 
    [1;34m29[0m: 
    [1;34m30[0m: 
    [1;34m31[0m:   openings
    [1;34m32[0m: [32mend[0m

