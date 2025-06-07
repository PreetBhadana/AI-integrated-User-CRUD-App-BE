require 'openai'

class OpenaiService
  def self.ask(prompt)
    client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])

    puts "Sending to OpenAI:", {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: prompt }],
      temperature: 0.7
    }.inspect

    # This is the correct syntax for v8.x
    # response = client.chat.completions.create(
    #   model: "gpt-3.5-turbo", # or gpt-4 if you have access
    #   messages: [
    #     { role: "user", content: prompt }
    #   ],
    #   temperature: 0.7
    # )
    response = client.chat(
      parameters: {
        model: 'gpt-3.5-turbo', # You can use 'gpt-3.5-turbo' for GPT-3.5
        messages: [{ role: 'user', content: prompt }],
        temperature: 0.7
      }
    )

    response_text = response.dig("choices", 0, "message", "content")
    response_text || "No response from OpenAI"
  rescue => e
    Rails.logger.error "OpenAI API request failed: #{e.inspect}"
    nil
  end
end