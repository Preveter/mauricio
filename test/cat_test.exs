defmodule MauricioTest.CatTest do
  use ExUnit.Case

  alias Mauricio.CatChat.Cat
  alias Mauricio.CatChat.Member
  alias Mauricio.CatChat.Cat.State.{Awake, Away, WantCare}
  alias Nadia.Model.User, as: NadiaUser

  test "joyful pet" do
    member = Member.new("A", "B", 1, 1, True)
    cat = Cat.new("C", WantCare.new(), 1, 1, 0)

    expected_text = """
    <i>A B гладит котика.</i>
    Мурррррррр.
    """

    {cat, member, text} = Cat.pet(cat, member)

    assert cat.state == Awake.new
    assert cat.times_pet == 1
    assert member.karma == 2
    assert text == expected_text
  end

  test "away pet" do
    member = Member.new("A", "B", 1, 1, True)
    cat = Cat.new("C", Away.new, 1, 1, 0)
    {cat, _member, text} = Cat.pet(cat, member)

    expected_text = """
    <i>A B хочет погладить котяру, но обнаруживает, что того нет дома.</i>
    """
    assert text == expected_text
    assert cat.times_pet == 0
  end

  test "user with only the first name is handled properly" do
    expected_text = """
    <i>One хочет погладить котяру, но обнаруживает, что того нет дома.</i>
    """
    cat = Cat.new("Mau", Away.new, 1, 1, 0)
    for member <- [
      Member.new("One", nil, 1),
      Member.new("One", nil, 1, 1, True),
      Member.new(%NadiaUser{first_name: "One", last_name: nil, id: 1}),
    ] do
      {_cat, _member, text} = Cat.pet(cat, member)
      assert text == expected_text
    end
  end
end
