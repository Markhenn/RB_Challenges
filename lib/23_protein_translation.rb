# Lets write a program that will translate RNA sequences into proteins. RNA can be broken into three nucleotide sequences called codons, and then translated to a polypeptide like so:

# RNA: "AUGUUUUCU" => translates to

# Codons: "AUG", "UUU", "UCU"
# => which become a polypeptide with the following sequence =>

# Protein: "Methionine", "Phenylalanine", "Serine"
# There are 64 codons which in turn correspond to 20 amino acids; however, all of the codon sequences and resulting amino acids are not important in this exercise.

# There are also four terminating codons (also known as 'STOP' codons); if any of these codons are encountered (by the ribosome), all translation ends and the protein is terminated. All subsequent codons after are ignored, like this:

# RNA: "AUGUUUUCUUAAAUG" =>

# Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>

# Protein: "Methionine", "Phenylalanine", "Serine"
# Note the stop codon terminates the translation and the final methionine is not translated into the protein sequence.--

# Below are the codons and resulting Amino Acids needed for the exercise.

# Codon	Amino Acids
# AUG	Methionine
# UUU, UUC	Phenylalanine
# UUA, UUG	Leucine
# UCU, UCC, UCA, UCG	Serine
# UAU, UAC	Tyrosine
# UGU, UGC	Cysteine
# UGG	Tryptophan
# UAA, UAG, UGA	STOP

# Problem:
# A class called Translation for translating proteins
#   class method of_condon(condon)
#     input: string or array of condons
#     output: string
#   class method of_rna(strand)
#     input: string -> multiple condons
#     output: array of strings
#
# Problem: class method of_condon
#   input is a string with a single condon or an array multiple condons
#   output is the matching protein
#
#   We need a translation table for protein to condon
#
#   Codon:
#     3 all caps letters
#     1 or more condons per protein
#     Stop condons
#
#   Algorithm
#     check if string or array of strings
#     if string -> return protein from lookup table
#     if array -> return protein for each codon and return condon if all are the
#     same
#
#   Lookup table
#     hash with keys as condon array and value as protein

# Problem: class method of_rna
#   input is a string with condons not separated
#   output is an array of string of proteins
#
#   only return the proteins before a stop, stop is not returned as well

#   Raise InvalidCondonError if condon in not found in lookup table
#
#   Algorithm
#     Split string into array after every third char
#     call each on array
#       call of_condon on each condon
#       raise InvalidCondonError if protein is nil
#       break if result is stop
#       push protein to result array

#     return result array

class InvalidCodonError < StandardError; end

class Translation
  STOP = 'STOP'
  CODONS = {
    %w(AUG) => 'Methionine',
    %w(UUU UUC) => 'Phenylalanine',
    %w(UUA UUG) => 'Leucine',
    %w(UCU UCC UCA UCG) => 'Serine',
    %w(UAU UAC) => 'Tyrosine',
    %w(UGU UGC) => 'Cysteine',
    %w(UGG) => 'Tryptophan',
    %w(UAA UAG UGA) => STOP
  }.freeze

  def self.of_codon(codon)
    protein = ''
    protein =  CODONS[codon] if codon.class == Array

    protein = CODONS.select { |codons, _| codons.include?(codon) }.values.first
    raise InvalidCodonError if protein.nil?
    protein
  end

  def self.of_rna(strand)
    strand.scan(/.../).map { |codon| of_codon(codon) }.take_while do |protein|
      protein != STOP
    end
  end
end
