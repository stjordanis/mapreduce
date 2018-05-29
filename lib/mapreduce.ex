defmodule MapReduce do
  require InputReader
  require Partition
  require OutputWriter

  def main(args) do
    args |> parse_args |> pipeline
  end

  defp pipeline([]) do
    IO.puts "No file given"
  end

  defp pipeline(options) do
    partition = elem(Partition.start, 1)
    OutputWriter.start
    InputReader.reader("#{options[:file]}", partition)
    forever()
  end

  defp forever do
    forever()
    #monitor Partition and OutputWriter and terminate
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [file: :string]
    )
    options
  end
end