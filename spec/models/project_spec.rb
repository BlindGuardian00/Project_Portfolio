require "rails_helper"

RSpec.describe Project, type: :model do

  context "validations tests" do
    it "ensures the title is present" do
      project = Project.new(body: "Content of the body")
      expect(project.valid?).to eq(false)
    end

    it "ensures the body is present" do
      project = Project.new(title: "Title")
      expect(project.valid?).to eq(false)
    end
    
    it "should be able to save project" do
      project = Project.new(title: "Title", body: "Some body content goes here")
      expect(project.save).to eq(true)
    end
  end

  context "scopes tests" do
    let(:params) { { title: "Title", body: "some body" } }
    before(:each) do
      Project.create(params)
      Project.create(params)
      Project.create(params)
    end

    it "should return all projects" do
      expect(Project.count).to eq(3)
    end
  end
end
