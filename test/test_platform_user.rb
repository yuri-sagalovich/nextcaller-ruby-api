require_relative './test_base'
require_relative './constants'

class PlatformUserTestCase < BaseTestCase

  def initialize(name)
    @account_id = 'user12345'
    super(name)
  end

  def test_platform_user_by_wrong_platform
    @account_id = 'user#12345'
    stub_request(:get, prepare_url_for_test('platform_users/%s' % @account_id)).to_return(:body => PLATFORM_USER_JSON_RESULT, :status => 200)
    assert_raises(ArgumentError) { @client_platform.get_platform_user(@account_id) }
  end

  def test_platform_user_json_request
    stub_request(:get, prepare_url_for_test('platform_users/%s' % @account_id)).to_return(:body => PLATFORM_USER_JSON_RESULT, :status => 200)
    res = @client_platform.get_platform_user(@account_id)
    assert_equal(res['number_of_operations'], 24)
  end

  def test_platform_update_user_by_wrong_platform
    @account_id = 'user#12345'
    stub_request(:post, prepare_url_for_test('platform_users/%s' % @account_id)).to_return(:status => 204)
    assert_raises(ArgumentError) { @client_platform.update_platform_user(@account_id) }
  end

  def test_platform_update_user_json_request
    stub_request(:post, prepare_url_for_test('platform_users/%s' % @account_id)).to_return(:status => 204)
    res = @client_platform.update_platform_user(@account_id, PLATFORM_USER_JSON_REQUEST_EXAMPLE)
    assert_equal(res.code, '204')
  end

end