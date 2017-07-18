class NumberInputEntry < Gtk::Box
  def initialize(game_button, target, default=0)
    super(:horizontal)

    label = Gtk::Label.new
    label.text = target.gsub(/_/, " ")
    add(label)

    entry = Gtk::Entry.new
    entry.text = default.to_s
    game_button.send("#{target}=", default)
    entry.max_length = 3
    entry.signal_connect("changed") do
      text = entry.text
      game_button.__send__("#{target}=", text.to_i) if /[0-9]+/ =~ text
    end
    pack_end(entry)
  end
end
