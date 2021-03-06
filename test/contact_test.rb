require_relative 'test_helper.rb'
require_relative '../lib/node.rb'
require_relative "../lib/contact.rb"
require_relative "../lib/fake_network_adapter.rb"

class ContactTest < Minitest::Test
  def setup
    @kn = FakeNetworkAdapter.new
    @node = Node.new('0', @kn)
    @options = { id: @node.id, ip: @node.ip }
  end

  def test_create_contact
    contact = Contact.new(@options)
    assert_instance_of(Contact, contact)
  end

  def test_update_last_seen
    contact = Contact.new(@options)
    last_seen = contact.last_seen

    contact.update_last_seen
    assert_operator(last_seen, :<, contact.last_seen)
  end
end
