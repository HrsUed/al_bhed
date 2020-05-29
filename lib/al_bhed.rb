require "al_bhed/version"

module AlBhed
  class Error < StandardError; end

  UPCASES = %w( A B C D E F G H I J K L M N O P Q R S T U V W X Y Z )
  DOWNCASES = %w( a b c d e f g h i j k l m n o p q r s t u v w x y z )
  UPCASED_ALBHEDS = %w( Y P L T A V K R E Z G M S H U B X N C D I J F Q O W )
  DOWNCASED_ALBHEDS = %w( y p l t a v k r e z g m s h u b x n c d i j f q o w )

  class ::String

    # Translate into Al Bhed
    #
    # Example:
    #   >> "Hi!".to_albhed
    #   => "Re!"
    #
    # Arguments:
    #   nothing

    def to_albhed
      self.chars.inject("") do |results, c|
        if idx = DOWNCASES.index(c)
          results << DOWNCASED_ALBHEDS[idx]
        elsif idx = UPCASES.index(c)
          results << UPCASED_ALBHEDS[idx]
        else
          results << c
        end
      end
    end
  end
end
