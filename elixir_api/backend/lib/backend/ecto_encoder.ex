defimpl Jason.Encoder, for: Any do
  def encode(struct, opts) when is_struct(struct) do
    if Map.has_key?(struct, :__meta__) do
      # Handle Ecto schemas (drop metadata and unwanted fields like passwords)
      struct
      |> Map.from_struct()
      |> Map.drop([:__meta__, :password])
      |> Jason.Encode.map(opts)
    else
      # Fallback for other structs
      Jason.Encode.map(Map.from_struct(struct), opts)
    end
  end
end
