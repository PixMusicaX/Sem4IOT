read -p "Enter a sentence: " sentence
sentence=$(echo $sentence | tr '[:upper:]' '[:lower:]')
vowel_count=0
consonant_count=0
for ((i=0; i<${#sentence}; i++))
do
    char=${sentence:$i:1}
    case $char in
        [aeiou])
            vowel_count=$((vowel_count+1))
            ;;
        [bcdfghjklmnpqrstvwxyz])
            consonant_count=$((consonant_count+1))
            ;;
        *)
            ;;
    esac
done

echo "The sentence '$sentence' contains $vowel_count vowels and $consonant_count consonants."
