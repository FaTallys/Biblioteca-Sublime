require "test_helper"

class EmprestimosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emprestimo = emprestimos(:one)
  end

  test "should get index" do
    get emprestimos_url, as: :json
    assert_response :success
  end

  test "should create emprestimo" do
    assert_difference("Emprestimo.count") do
      post emprestimos_url, params: { emprestimo: {} }, as: :json
    end

    assert_response :created
  end

  test "should show emprestimo" do
    get emprestimo_url(@emprestimo), as: :json
    assert_response :success
  end

  test "should update emprestimo" do
    patch emprestimo_url(@emprestimo), params: { emprestimo: {} }, as: :json
    assert_response :success
  end

  test "should destroy emprestimo" do
    assert_difference("Emprestimo.count", -1) do
      delete emprestimo_url(@emprestimo), as: :json
    end

    assert_response :no_content
  end
end
