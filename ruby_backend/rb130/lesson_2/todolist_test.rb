require 'minitest/autorun'
require "minitest/reporters"
require 'simplecov'
SimpleCov.start
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @todos.first)
  end

  def test_last
    assert_equal(@todo3, @todos.last)
  end

  def test_shift
    assert_equal(@todo1, @todos.shift)
  end

  def test_pop
    assert_equal(@todo3, @todos.pop)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_type_error
    assert_raises(TypeError) { @list << 1 }
  end

  def test_shovel
    new_list = @list
    new_list << @todo1
    assert_equal(4, new_list.size)
  end

  def test_add
    new_list = @list
    new_list.add(@todo1)
    assert_equal(4, new_list.size)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(6) }
  end

  def test_mark_done_at
    assert_equal(false, @list.first.done)
    assert_raises(IndexError) { @list.mark_done_at(9) }
    @list.mark_done_at(0)
    assert_equal(true, @list.first.done)
  end

  def test_mark_undone_at
    assert_equal(false, @list.first.done)
    @list.mark_done_at(0)
    assert_equal(true, @list.first.done)
    assert_raises(IndexError) { @list.mark_undone_at(9) }
    @list.mark_undone_at(0)
    assert_equal(false, @list.first.done)
  end

  def test_done!
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_equal(@list.first, @todo1)
    @list.remove_at(0)
    assert_equal(@list.first, @todo2)
    assert_raises(IndexError) { @list.remove_at(9) }
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s
    new_list = @list.dup
    new_list.first.done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, new_list.to_s)
  end

  def test_to_s
    new_list = @list.dup
    new_list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, new_list.to_s)
  end

  def test_each
    test = []
    @list.each { |e| test << 'x' }
    assert_equal(['x', 'x', 'x'], test)
  end

  # def test_each_returns_original_list
  #   assert_equal(@list, @list.each {|todo| nil })
  # end

  def test_select
    result = @list.select { |e| true }
    refute_same(result, @list)
  end
end