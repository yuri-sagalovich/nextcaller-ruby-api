require_relative './test_base'
require_relative './constants'

class PlatformProfileTestCase < BaseTestCase

  def initialize(name)
    @profile_id = '97d949a413f4ea8b85e9586e1f2d9a'
    @account_id = 'user12345'
    super(name)
  end

  def test_platform_profile_get_json_request
    stub_request(:get, prepare_url_for_test('users/')).to_return(:body => PROFILE_JSON_RESULT_EXAMPLE, :status => 200)
    res = @client_platform.get_by_profile_id(@profile_id, @account_id)
    assert_equal(res['email'], 'demo@nextcaller.com')
    assert_equal(res['first_name'], 'Jerry')
    assert_equal(res['last_name'], 'Seinfeld')
  end

  def test_platform_profile_update_json_request
    stub_request(:post, prepare_url_for_test('users/')).to_return(:status => 204)
    res = @client_platform.update_by_profile_id(@profile_id, @account_id, PROFILE_JSON_REQUEST_EXAMPLE)
    assert_equal(res.code, '204')
  end

end
