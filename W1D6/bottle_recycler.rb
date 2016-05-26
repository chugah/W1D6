require 'colorize'

@returned_bottles = 0
@returned_caps = 0
@redeemed_bottles = 2
@redeemed_caps = 4
@bottles_cost = 2
@bottles_purchased = 0
@purchase = 0


@prompt = ">> ".yellow

def future_redemptions
  puts "\nBring back today's purchased bottles and caps to receive" \
  " #{@bottles_purchased/2} free bottles of pop!".magenta
end

def transaction_summary
  print "\n"
  printf("%-25s %-16s \n", "Total bottles purchased:", "#{@purchase}")
  printf("%-25s %-16s \n", "Total bottles returned:", "#{@bottles_returned}")
  printf("%-25s %-16s \n", "Total caps returned:", "#{@caps_returned}")
  printf("%-25s %-16s \n", "Total from redemptions:", "#{@total_redeemed}")
  future_redemptions
end

def bottles_from_redemption
  @total_redeemed = @returned_bottles + @returned_caps
  puts "You get #{@total_redeemed} bottles of pop for returning your used bottles"\
  " and caps.".magenta
end
  
def redeemed_bottles(num_of_bottles)
  return if num_of_bottles.zero? # base case
  if num_of_bottles % 2 == 0
    @returned_bottles += 1
    redeemed_bottles(num_of_bottles - 2)    # getting closer to base case 
    @returned_bottles
  else
    @returned_bottles = @bottles_returned / 2
  end
end               

def redeemed_caps(num_of_caps)
  return if num_of_caps.zero? # base case
  if num_of_caps % 4 == 0
    @returned_caps += 1
    redeemed_caps(num_of_caps - 4)    # getting closer to base case 
    @returned_caps
  else
    @returned_caps = @caps_returned / 4
  end
end

def customer_return
  puts "\nHow many bottles are you returning today?".blue
  print @prompt
  @bottles_returned = gets.chomp.to_i
  
  puts "\nAnd how many caps?".blue
  print @prompt
  @caps_returned = gets.chomp.to_i
end

def bottles_purchased(dollars)
  @purchase = dollars / @bottles_cost
  puts "\nEnjoy your #{@purchase} bottles of pop!".magenta 
end

def customer_purchase
  puts "\nHow much would you like to spend on pop?".blue
  print ">> $".yellow
  @bottles_purchased = gets.chomp.to_i
end

def is_purchasing?
  puts "Are you here to purchase pop or return your empty bottles and caps? Yes or no.".magenta
  print @prompt 
  purchasing = gets.chomp.downcase
  exit unless purchasing == "yes"
end

def customer_assist
  puts "\nWelcome to the Bottle Depot.".upcase.blue
  is_purchasing?
  customer_purchase
  bottles_purchased(@bottles_purchased)
  customer_return
  redeemed_bottles(@bottles_returned)
  redeemed_caps(@caps_returned)
  bottles_from_redemption
  transaction_summary
  customer_assist
end

customer_assist

  